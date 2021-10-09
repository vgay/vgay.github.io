
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

title = #"My Favorite Things"
composer = #"O. Hammerstein II and R. Rogers"
meter = #"(Jazz Waltz)"
kwtempo = #"Med. Fast"
kwstyle = #"Jazz Waltz"

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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
e2.:m7 fis:m7 e2.:m7 fis:m7 c2.*4:7+ a2.:m7 d:7 g:7+ c:7+ g:7+ c:7+ fis:m5-7 b:9-
e2.:7+ fis:m7 e:7+ fis:m7 a2.*4:7+ a2.:m7 d:7 g:7+ c:7+ g:7+ c:7+ fis:m5-7 b:9-
e2.*2:m7 fis2.:m5-7 b:9- e:m7 e:m/d c2.*2:7+ 
c:7+ a:7 g2.:7+ c2.*2:7+ d2.:7
g:7+ c:7+ g:7+ c:7+ g:7+ c:7+ fis:m5-7 b:9- s s e:m7
}


theNotes =  \relative c' {
  \clef "treble" \key g \major \time 3/4
  \set Score.markFormatter = #format-mark-box-alphabet
  \showStartRepeatBar \bar "[|:" \mark #1
\repeat volta 2 {
  e4 b' b | fis e e | b e e | fis e2 | e4 b' b | fis e e | b e e | fis e2 |  \break
  e4 b' a | e fis d | d a' g | c,2. | b4 c d | e fis g | a b a | dis,2. \break
}
\mark #2
e4 b' b | fis e e | b e e | fis e2 | e4 b' b | fis e e | b e e | fis e2 |  \break
e4 b' a | e fis d | d a' g | c,2. | b4 c d | e fis g | a ais b | c2. \bar "||"  \break
\mark #3
r4 b b | b2 e,4 | r4 a a | a2 dis,4 | r4 g g | g2 b,4 | e2. ~ | e2 e4 \break
e fis e | fis e fis | g a g | a2 g4  | b c b | c2. ~ | c | b \break
g ~ g ~ g ~ g R R R R 
\once \override Score.RehearsalMark #'direction = #DOWN
\mark \markup \with-color #red fine
  \bar "|." \stopStaff s2. \bar "" s \startStaff
%     \doubleMark 
%   \markup {\with-color #red \bold "To Coda"}
%   \markup { \with-color #red \musicglyph "scripts.varcoda" }
\Coda  R \fermata \bar ".."
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
  \bar "[|:" e1:m7 fis:m7 e:m7 fis:m7 \break
  \repeat percent 4 c:7+ \break
  a:m7 d:7 g:7+ c:7+ \break
  g:7+ c:7+ fis:m5-7 b:9- \bar ":|]" \break
  e:7+ fis:m7 e:7+ fis:m7 \break
 \repeat percent 4 a:7+ \break
 a:m7 d:7 g:7+ c:7+ \break
 g:7+ c:7+ fis:m5-7 b:9- \bar "||" \break
 \repeat percent 2 e:m7 fis:m5-7 b:9-  \break
 e:m7 e:m/d \repeat percent 2 c:7+ \break
 \repeat percent 2 c:7+ \repeat percent 2 a:7 \break
 g:7+ \repeat percent 2 c:7+  d:7 \break
 g:7+ c:7+ g:7+ c:7+ \break
 g:7+ c:7+ fis:m5-7 b:9-  \break
 e:m7 \fermata   \bar ".." \stopStaff s \bar "" s \bar "" s \bar ""
 }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
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
          \transpose c d \theNotes
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
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
 } }

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
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
 } }

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
          %\new Voice  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
 } }

