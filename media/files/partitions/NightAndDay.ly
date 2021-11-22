
\version "2.22.0"
#(set-global-staff-size 18)
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

title = #"Night and Day"
composer = #"Cole Porter"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    %voltaSpannerDuration = #(ly:make-moment 4 4)
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
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
  \context { \Score markFormatter = #format-mark-box-alphabet }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
 s2 as1:7+ g:7 c:7+ s as1:7+ g:7 c:7+ s  
 fis:m5-7 f:m7 e:m7 es:dim7 d:m7 g:7 c:7+ s bes:7
 es:7+ s c:7+ s es:7+ s c:7+ s 
  fis:m5-7 f:m7 e:m7 es:dim7 d:m7 g:7 c:6 s
  d1:m5-7/g c:6.9 bes:6.9 c:6.9 bes:6.9 c:6.9 bes2:6.9 g:5+7 c4:7+ cis:7 c2:7+
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \partial 2 g4 g8 g~ \mark #1
  \repeat volta 2 {
    g1~ | g2 \times 2/3 { f4 e dis } | e1~ | e2 g4 g8 g~ |
    g4 g g g | g f \times 2/3 { f4 e dis } | e1~ | e2 r8 e4 e8 |
    e4 e e e | es2~8 es4 es8 | d4 d d d | d4 des8 c~ c4 b |
    a4 as8 g~ g2~ | g2 g'4 g8 g~| g1~ | 
  }
  \alternative {
    { g4 r g g8 g\laissezVibrer }
    {g4 \repeatTie r g g \bar "||" \break }
  }
  \mark #2
  bes1~ | bes2 \times 2/3 { g4 f e } | g4 g8 g~ g2~ | g r8 g4 g8 |
  bes8 c4-. bes8 c4 bes8 c~ | c bes4. \times 2/3 { g4 f e } | 
  g4 g8 g~ g2~ | g r8 e4 e8 | \break
  e4 e e e | es2 r8 es4 es8 | d4 d d d |
  d8 des c b' ~ b bes a4 | g4 g8 g~ g2~ | 
  g c4 c8 c \laissezVibrer | 
  \tweak self-alignment-X #RIGHT
  \mark \markup  \with-color #(x11-color 'red) "To Coda"
  \comp #4 \mark \markup "Solo Break" \comp #4 \bar "|." \break
  \Coda c2 \repeatTie c4 c8 c~ | c1~ | c2 c4 c8 c~ | c1~ | c2 c4 c8 c~ | c1~ | c2 g4 g8 b~ | b1 ~ b1 \fermata
  
\bar ".." 
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
    as1:7+ g:7 \repeat percent 2c:7+ \break
    as1:7+ g:7 \repeat percent 2c:7+ \break
    fis:m5_7 f:m7 e:m7 es:dim7 \break
    d:m7  g:7 c:7+ \set Score.repeatCommands = #'((volta "1")) c:7+ \set Score.repeatCommands = #'((volta #f))
    \stopStaff s \bar "" s \bar "" s \startStaff
    \set Score.repeatCommands = #'((volta "2")) bes:7 
    \set Score.repeatCommands = #'((volta #f)) \break
    \repeat percent 2 es:7+ \repeat percent 2 c:7+ \break
    \repeat percent 2 es:7+ \repeat percent 2 c:7+ \break
     fis:m5_7 f:m7 e:m7 es:dim7 \break
     d:m7 g:7 \repeat percent 2 c:6 \bar "|."
     d:m5-7 c:6.9 bes:6.9 c:6.9 \break
     bes:6.9 c:6.9 \/bes2:6.9 g:5+7 \y c4:7+ cis:7 c2:7+ \break
     c1:7+ \bar ".." \stopStaff s \bar "" s \bar "" s \bar ""
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 A s1*19 
  s1 ^\markup \bold \box \fontsize #5 B s1*13 
    \once \override TextScript #'extra-offset = #'( -1 . 0 )
  s1 ^\markup \fontsize #3 \musicglyph #"scripts.varcoda" s1
  s1 ^\markup \fontsize #3 \musicglyph #"scripts.varcoda" s1*7 s4. s32
  
   s ^\markup \fontsize #3 \musicglyph #"scripts.ufermata"
}


verse = \lyricmode {
  Night and day __ you are the one __
On -- ly you be -- neath the moon or un -- der the sun __
Whe -- ther near to me, or far
It's no mat -- ter dar -- ling where you are
I think of you __ day and night __
Night and day \repeat unfold 3 { \skip 1 }

Day __ un -- der the hide of me __
There's an oh such a hun -- gry year -- ning bur -- ning in -- side of me __
And this tor -- ment won't be through
'til you let me spend my life ma -- king love to you
Day and night __  night and day 
Day Night and Day __ Night and Day __ Night and Day __ Night and Day __
}

verseB = \lyricmode {
  \repeat unfold 3 { \skip 1 }
  Why is it so __ 
That this lon -- ging for you follows wher -- e -- ver I go __
In the roa -- ring traf -- fic's boom
In the si -- lence of my lon -- 'ly room
I think of you __  day and night __  \repeat unfold 4 { \skip 1 }
Night and 
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d' \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          \new Voice <<
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          >>
          \new Voice { 
            s2 \repeat unfold 3 { s1*4 \break }  s1*5 \break
            \repeat unfold 5 { s1*4 \break } }           
        >> 
      >>
    } %\form
    }  \bookpart {
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
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
        <<
          \new Voice <<
          \transpose c d' \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          >>
          \new Voice { 
            s2 \repeat unfold 3 { s1*4 \break }  s1*5 \break
            \repeat unfold 5 { s1*4 \break } }           
        >> 
      >>      
      >>
    } %\form
    }  \bookpart {
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
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
        <<
          \new Voice <<
          \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
          >>
          \new Voice { 
            s2 \repeat unfold 3 { s1*4 \break }  s1*5 \break
            \repeat unfold 5 { s1*4 \break } }           
        >> 
      >>
      >>
    } %\form
    }  \bookpart {
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
} } }

