
\version "2.22.00"
#(set-global-staff-size 17)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"


\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"The Color of You"
composer = #"Salvadore Poe"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Lisa Ekdahl" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=6X_tmj50Wq4"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as sung by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}


\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##t
  s4 e2:m7 a:7 fis:9+ b:5+7 e2:m7 a:7 fis:9+ b:5+7 e2:m7 a:7 fis:9+ b:5+7 e2:m7 a:7 fis:9+ b:5+7 
  e1:7+ c:dim cis:m7 a:m6 gis:m7 cis2:9 cis:9- fis:5+7 fis:7 b:9 b:9-
  e1:7+ c:dim cis:m7 a:m6 gis:m7 cis2:9 cis:9- fis:5+7 fis:7 fis:m7 b:9
  a1:m7 d:9 g:7+ g:6 g:m7 c:9 gis2:m7 g:dim fis:m7 b:13 
  e1:7+ c:dim cis:m7 a:m6 gis:m7 cis2:9 cis:9- fis:5+7 fis:7 fis:m7 b:9
  e2:m7 a:7 fis:9+ b:5+7 e2:m7 a:7 fis:9+ b:5+7 
}

theNotes =  \relative c'' {
  \clef "treble" \key e \major \time 4/4
  \partial 4 r4 \A 
  \repeat volta 2 {
    \parenthesize e2 _"2x only" r \repeat unfold 3 R1 \break \repeat unfold 4 R1 \break \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    \override TextSpanner.bound-details.left.text = "tacet 2nd x" %\textSpannerDown
    b1 \startTextSpan | r8 a4 b8 c dis r a' | gis1 | r8 a,4 b8 c b r a | \break
    gis2 r4 r8 dis' | dis4 r r dis | 8 d8 r cis r4 dis | cis8 c r b r4 cis | \break  \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    b1 | r8 a4 b8 c dis r a' | gis1 | r4 fis,8 gis a cis4 e8 | \break
    gis2 r4 r8 e | dis4 \stopTextSpan r r gis | gis8 g r fis r fis gis4 | cis,2 dis | \break  \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \C
    e2. r4 | r4 d8 e fis e r d | b1 | r4 d8 8 4 4 | \break
    2 r | r4 c8 d e d r c | b2 e | d r4 b | \break  \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    gis1 | r8 a4 b8 c dis r a' | gis1 | r4 fis,8 gis a cis4 e8 | \break
    gis2 r8 a r gis | r2 r4 gis | gis8 g r fis r4 gis | cis,2 dis | } \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \fontsize #2 \box A "(sax solo over A)" }
  \repeat volta 2 { e2.  r4 \repeat unfold 3 R1 }
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "Ad lib."
}

HornI =  \relative c' {
  \clef "treble" \key e \major \time 4/4
  \partial 4 r4 \A 
  \repeat volta 2 {
    r8 e g a g e r4 | r e fis r |
    r8 e g a g e r4 | r e fis r8 b->| \break \noPageBreak
    r8 e, g a g e r4 | r e fis r |
    r8 e g a g e r4 | fis' b,2. \break  \bar "||"  \noPageBreak
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    b8_"2nd x only" b8 4 bes8 b r es8~ | 2. as4 | 
    e8 cis gis e r gis cis4 | e b8 a b a r gis \break  \noPageBreak
    r4 dis'8 d dis b gis b | dis4 a8 gis~ gis cis dis r |
    fis2. gis4 | b2. r4 \break  \bar "||"  \noPageBreak
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    r2 b,,4. c8~ | c4 r r2 | 
    r c4. 8~ | 4 r r2 | \break
    r b4. cis8~ | 4 r r2 | 
    e8 e r8 8~ 2 | r4 fis4~ 2 | \break  \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \C 
    es2 r | R1*7 |  \break  \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    R1*8 }
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \fontsize #2 \box A "(sax solo over A)" }
  \break  \repeat volta 2 {
    r8 e g a g e r4 | r e fis r | r8 e g a g e r4 | r e fis r8 b->| }
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "Ad lib."

}

HornII =  \relative c {
  \key e \major \time 4/4
  \partial 4 r4 \A 
  \repeat volta 2 {
    \override MultiMeasureRest #'staff-position = #0
    %\repeat volta 2 {
    r8 e g a g e r4 | r a b r |
    r8 e, g a g e r4 |r a b r8 e->| \break
    r8 e, g a g e r4 | r a b r|
    r8 e, g a g e r4 | fis' b,2.  \bar "||" \break
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    gis8_"2nd x only" gis8 4 g8 gis r c8~ | 2. dis4 | 
    cis!8 gis e cis r e gis4 | c aes8 fis aes8 fis r e \break
    r4 b'8 bes b gis e gis | b8 r e,  dis~ dis r r4 | 
    fis8 fis fis fis cis2 |  fis8 fis fis fis dis4 c'
    \break \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    b1 | r4 a8 b \tuplet 3/2 { c4 dis a' } | gis1  
    r8 fis,4 gis8 a cis e gis~ | \break
    gis2. r4| R1 |  
    d8 d r8 cis8~ 2 | r4 4~ 2 | \bar "||" \break
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \C
    c2 r | R1*7 |  \break  \bar "||"
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
    R1*8 
  }
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \fontsize #2 \box A "(sax solo over A)" }
  \break  \repeat volta 2 {  
    r8 e, g a g e r4 | r a b r | r8 e, g a g e r4 |r a b r8 e->| }
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "Ad lib."
}

HornIII =  \relative c, {
  \key e \major \time 4/4
  \partial 4 d8 dis  \A 
  e4 r8 b' c cis4 r8 | r2 r4 d,8 dis | 
  e4 r8 b' c cis4 r8 | R1 | 
  e,4 r8 b' c cis4 r8 | r2 r4 d,8 dis | 
  e4 r8 b' c cis4 r8 | fis4 b,2.  \bar "||" \break
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B 
  s1*8 | \bar "||" \break
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B
  r2_"2nd x only" gis'4. a8~ | 4 r4 r2 | 
  r2 e'4. \glissando c8~ | 4 r4 r2 |
  2 gis4. 8~ | 2 s2 | 
  ais8 8 r8 fis8~ 2 | r4 4~ 2 | 
  \bar "||" \break
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \C
  a2 r | s1*7 \bar "||" \break
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \B
  s1*7 r2 r4 d,,8 dis
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \bold \fontsize #2 \box A "(sax solo over A)" }
  \break  \repeat volta 2 {  
    e4 r8 b' c cis4 r8 | r2 r4 d,8 dis | e4 r8 b' c cis4 r8 | R1 | }
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark #'direction = #DOWN
  \mark \markup "Ad lib."
}

verseA = \lyricmode {
  true
  Blue is the co -- lor of love
  When your lo -- ver has gone from you
  Your heart is filled with lon -- ging to have new
  What came once from o -- thers

  When you o -- pen your heart for two
  But now it's true and you re -- a -- lize
  What il -- lu -- sion can do
  If you close your eyes
  But the dre -- aming is o -- ver now

  So blue is the co -- lor of you
  When you're wai -- ting for some -- one who
  Will al -- ways make your dreams come true

}
grille = \chordmode {
  \bar "[|:" 
  \/e2:m7 a:7 \/fis:9+ b:5+7 \/e2:m7 a:7 \/fis:9+ b:5+7 \break \bar ":|][|:"
  e1:7+ c:dim cis:m7 a:m6 \break
  gis:m7 \/cis2:9 cis:9- \/fis:5+7 fis:7 
  \set Score.repeatCommands = #'((volta "1")) \s b:9 b:9-
  \set Score.repeatCommands = #'((volta #f) end-repeat) \break
  \stopStaff s1 \bar "" s \bar "" s \startStaff 
  \set Score.repeatCommands = #'((volta "2")) \s fis2:m7 b:9 \break
  \bar "||" \break \set Score.repeatCommands = #'((volta #f)) 
  \startStaff a1:m7 d:9 g:7+ g:6  \break
  g:m7 c:9 \/gis2:m7 g:dim \/fis:m7 b:13 \break
  e1:7+ c:dim cis:m7 a:m6 \break
  gis:m7 \/cis2:9 cis:9- \/fis:5+7 fis:7 \/fis:m7 b:5+7  \break \bar ":|][|:"
  \/e2:m7 a:7 \/fis:9+ b:5+7 \/e2:m7 a:7 \/fis:9+ b:5+7
  \bar ":|]" }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*3 
  s1 ^\markup \bold \box \fontsize #7 B s1*11 
  s1 ^\markup \bold \box \fontsize #7 C s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7
  s1 ^\markup \bold { \fontsize #5 \musicglyph "scripts.varcoda" \raise #-1 " (ad lib.)" }
}

\book {
  \paper {
    #(set-paper-size "tablette")
    print-page-number = #f
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages"
   copyright = "please report any errors to vgay@vintherine.org" }
\markup {
      \column {      
        \vspace #3
        \fill-line { \fontsize #9 "The Color of You" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
          \fill-line { "C version" } 
         }
        \vspace #2      
        \fontsize #4 {
           \line  {  \hspace #10 Vocal \fontsize #-2 "with lyrics (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn I \fontsize #-2 "trumpet, soprano or alto sax (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn II \fontsize #-2 "trombone or tenor sax (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn III \fontsize #-2 "Bass trombone or barytone sax (2 pages)" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "vocal" } <<
          << { \theNotes \addlyrics \verseA } \\ { s4 s1*20 \pageBreak } >>
          
        >> 
      >>
    }
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Horn 1" } <<
           \HornI
        >> 
      >>
    }
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Horn 2" } <<
          { \clef "bass" \HornII }
        >> 
      >>
    } 
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Horn 3" } <<
          << { \override Rest #'staff-position = #0 \clef "bass" \HornIII } \\ 
             { \override MultiMeasureRest #'staff-position = #0
               s4 s1*8 R1*8 s1*9 R1*14  } >>
        >> 
      >>
    }
  } 
}

\book {
  \paper {
    #(set-paper-size "tablette")
    print-page-number =#f
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages"
   copyright = "please report any errors to vgay@vintherine.org" }
\markup {
      \column {      
        \vspace #3
        \fill-line { \fontsize #9 "The Color of You" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
           \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " B \flat " "} }
          \fill-line { \concat {B \small \flat " Version"} } 
         }
        \vspace #2      
        \fontsize #4 {
           \line  {  \hspace #10 Vocal \fontsize #-2 "with lyrics (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn I \fontsize #-2 "trumpet, soprano or alto sax (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn II \fontsize #-2 "trombone or tenor sax (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn III \fontsize #-2 "Bass trombone or barytone sax (2 pages)" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }  
}
      \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }      
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = "Vocal" } <<
          << { \transpose c d \theNotes \addlyrics \verseA } \\ { s4 s1*20 \pageBreak } >>       
        >> 
      >>
    }
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Horn 1" } <<
          \transpose c d \HornI
        >> 
      >>
    } 
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Horn 2" } <<
          { \clef "treble_8" \transpose c d \HornII }
        >> 
      >>
    } 
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Horn 3" } <<
          << { \override Rest #'staff-position = #0 \clef "treble_15" \transpose c d \HornIII } \\ 
             { \override MultiMeasureRest #'staff-position = #0
               s4 s1*8 R1*8 s1*9 R1*14  } >>
        >> 
      >>
    } 
  }
}

\book {
  \paper {
    #(set-paper-size "tablette")
    print-page-number = #f
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages"
   copyright = "please report any errors to vgay@vintherine.org" }
\markup {
      \column {      
        \vspace #3
        \fill-line { \fontsize #9 "The Color of You" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " E \flat " "} }
          \fill-line { \concat {E \small \flat " Version"} } 
         }
        \vspace #2      
        \fontsize #4 {
           \line  {  \hspace #10 Vocal \fontsize #-2 "with lyrics (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn I \fontsize #-2 "trumpet, soprano or alto sax (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn II \fontsize #-2 "trombone or tenor sax (2 pages)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn III \fontsize #-2 "Bass trombone or barytone sax (2 pages)" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }  
}
\bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
  \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Vocal" } <<
           << { \transpose c a, \theNotes \addlyrics \verseA } \\ { s4 s1*20 \pageBreak } >>   
        >> 
      >>
    }
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Horn 1" } <<
          \transpose c a \HornI
        >> 
      >>
    }
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Horn 2" } <<
          { \clef "treble_8" \transpose c a \HornII }
        >> 
      >>
    } 
  } 
  \bookpart {
  \header { copyright = "" }
  \paper { page-count = #2 }    
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Horn 3" } <<
          % { \clef "bass" \HornIII } 
          << { \override Rest #'staff-position = #0 \clef "treble_15" \transpose c a, \HornIII } \\ 
             { \override MultiMeasureRest #'staff-position = #0
               s4 s1*8 R1*8 s1*9 R1*14  } >>
        >> 
      >>
    }
  }
}

\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \header { copyright = "please report any errors to vgay@vintherine.org" }
    \paper {
      print-page-number =#f
    }    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "The Color of You" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
          \fill-line { "C version" } 
        }
        \vspace #2      
        \fontsize #4 {
          \line  {  \hspace #10 Lead Sheet }
          \vspace #0.3
          \line  {  \hspace #10 Rhythm section \fontsize #-2 "(Chord grid)" }
          \vspace #0.3
          \line  {  \hspace #10 Vocal \fontsize #-2 "(with lyrics)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn I \fontsize #-2 "(trumpet, soprano or alto sax)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn II \fontsize #-2 "(trombone or tenor sax)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn III \fontsize #-2 "(Bass trombone or barytone sax)" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \theNotes
          \addlyrics \verseA
        >> 
        \new StaffGroup \with { instrumentName = "Horns" } <<
          \new Staff 
          <<
            \HornI
          >> 
          \new Staff 
          <<
            << { \clef "bass" \HornII } \\ { \HornIII } >>
          >> 
        >>
      >>
    }
  }  \bookpart {
    \paper {
      print-page-number =#f
    }    
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
  } } 
  \bookpart {
    \paper {
      print-page-number =#f
    }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Vocal" } <<
          \theNotes
          \addlyrics \verseA
        >> 
      >>
    } 
  }   \bookpart {
    \paper {
      print-page-number =#f
    }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Horn 1" } <<
          \HornI
        >> 
      >>
    }
  } 
  \bookpart {
    \paper {
      print-page-number =#f
    }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Horn 2" } <<
          { \clef "bass" \HornII }
        >> 
      >>
    } 
  } 
  \bookpart {
    \paper {
      print-page-number =#f
    }    
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = "Horn 3" } <<
          % { \clef "bass" \HornIII } 
          << { \override Rest #'staff-position = #0 \clef "bass" \HornIII } \\ 
             { \override MultiMeasureRest #'staff-position = #0
               s4 s1*8 R1*8 s1*9 R1*14  } >>
        >> 
      >>
    } 
  } 
}

\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \header { copyright = "please report any errors to vgay@vintherine.org" }
    \paper {
      print-page-number =#f
    }    
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "The Color of You" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " B \flat " "} }
          \fill-line { \concat {B \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \line  {  \hspace #10 Lead Sheet }
          \vspace #0.3
          \line  {  \hspace #10 Rhythm section \fontsize #-2 "(Chord grid)" }
          \vspace #0.3
          \line  {  \hspace #10 Vocal \fontsize #-2 "(with lyrics)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn I \fontsize #-2 "(trumpet, soprano or alto sax)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn II \fontsize #-2 "(trombone or tenor sax)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn III \fontsize #-2 "(Bass trombone or barytone sax)" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }  \bookpart {
    \paper {
      page-count = #2
    }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } 
        <<
          \transpose c d \theNotes
          \addlyrics \verseA
        >> 
        \new StaffGroup \with { instrumentName = "Horns" } <<
          \new Staff 
          <<
            \transpose c d \HornI
          >> 
          \new Staff 
          <<
            << { \clef "treble_15" \transpose c d \HornII } \\ { \transpose c d \HornIII } >>
          >> 
        >>
      >>
    } 
  }  \bookpart {
    \paper { print-page-number =#f }
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
    } 
  } 
  \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Vocal" } <<
          \transpose c d \theNotes
          \addlyrics \verseA
        >> 
      >>
    } 
  }   \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Horn 1" } <<
          \transpose c d \HornI
        >> 
      >>
    } 
  } 
  \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Horn 2" } <<
          { \clef "treble_8" \transpose c d \HornII }
        >> 
      >>
    } 
  } 
  \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = "Horn 3" } <<
          % { \clef "bass" \HornIII } 
          << { \override Rest #'staff-position = #0 \clef "treble_15" \transpose c d \HornIII } \\ 
             { \override MultiMeasureRest #'staff-position = #0
               s4 s1*8 R1*8 s1*9 R1*14  } >>
        >> 
      >>
    } 
  }
}

\book {
  \paper {
    #(set-paper-size "a4")
    first-page-number =#0
  }
  #(define output-suffix "Eba4") 
  \bookpart {
    \paper {
      print-page-number =#f
    }    
    \header { copyright = "please report any errors to vgay@vintherine.org" }
    \markup {
      \column {      
        \vspace #5
        \fill-line { \fontsize #9 "The Color of You" }
        \fill-line { "Music Sheet for Combo" }
        \vspace #2
        \fontsize #4 {
          \fill-line { \pad-around #2 \fontsize #3 \circle \bold \concat {" " E  \flat " "} }
          \fill-line { \concat {E \small \flat " Version"} } 
        }
        \vspace #2      
        \fontsize #4 {
          \line  {  \hspace #10 Lead Sheet }
          \vspace #0.3
          \line  {  \hspace #10 Rhythm section \fontsize #-2 "(Chord grid)" }
          \vspace #0.3
          \line  {  \hspace #10 Vocal \fontsize #-2 "(with lyrics)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn I \fontsize #-2 "(trumpet, soprano or alto sax)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn II \fontsize #-2 "(trombone or tenor sax)" }
          \vspace #0.3
          \line  {  \hspace #10 Horn III \fontsize #-2 "(Bass trombone or barytone sax)" }
        }
        \vspace #3
        \override #'(line-width . 120)
        \fontsize #2 \fill-line { " " "Lilypond sources embeded in pdf file" }
      }
    }
  }
  \bookpart {
    \paper {
      page-count = #2
    }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } 
        <<
          \transpose c a, \theNotes
          \addlyrics \verseA
        >> 
        \new StaffGroup \with { instrumentName = "Horns" } <<
          \new Staff 
          <<
            \transpose c a \HornI
          >> 
          \new Staff 
          <<
            << { \clef "treble_15" \transpose c a, \HornII } \\ { \transpose c a, \HornIII } >>
          >> 
        >>
      >>
    } 
  }  \bookpart {
    \paper { print-page-number =#f }
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
    } 
  }
  \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Vocal" } <<
          \transpose c a, \theNotes
          \addlyrics \verseA
        >> 
      >>
    } 
  }   \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Horn 1" } <<
          %<< { \theNotes \addlyrics \verseA } \\ { s4 s1*20 \pageBreak } >>
          \transpose c a \HornI
        >> 
      >>
    }
  } 
  \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Horn 2" } <<
          %<< { \theNotes \addlyrics \verseA } \\ { s4 s1*20 \pageBreak } >>
          { \clef "treble_8" \transpose c a \HornII }
        >> 
      >>
    }
  } 
  \bookpart {
    \paper { print-page-number =#f }
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = "Horn 3" } <<
          % { \clef "bass" \HornIII } 
          << { \override Rest #'staff-position = #0 \clef "treble_15" \transpose c a, \HornIII } \\ 
             { \override MultiMeasureRest #'staff-position = #0
               s4 s1*8 R1*8 s1*9 R1*14  } >>
        >> 
      >>
    } 
  }
}